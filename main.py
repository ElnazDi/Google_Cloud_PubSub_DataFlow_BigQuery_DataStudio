from avro.io import BinaryEncoder, DatumWriter
import avro
import os
import io
import json
from google.api_core.exceptions import NotFound
from google.cloud.pubsub import PublisherClient
from google.pubsub_v1.types import Encoding
from pathlib import Path


project_id = "dataengineering-315913"
topic_id = "hello_topic"
##avsc_file = Path("schema.avsc")
# print(avsc_file.name)
avsc_file = "/Users/dehkharghanielnaz/Desktop/Data_Engineering/schema.avsc.txt"
print(os.listdir())

publisher_client = PublisherClient()
topic_path = publisher_client.topic_path(project_id, topic_id)

# Prepare to write Avro records to the binary output stream.
avro_schema = avro.schema.parse(open(avsc_file, "rb").read())
writer = DatumWriter(avro_schema)
bout = io.BytesIO()

# Prepare some data using a Python dictionary that matches the Avro schema
record = {"lsoa_code": "E01001116", "borough": "Croydon", "major_category": "Burglary",
          "minor_category": "Burglary in Other Buildings", "value": 0, "year": 2016, "month": 11}

try:
    # Get the topic encoding type.
    topic = publisher_client.get_topic(request={"topic": topic_path})
    encoding = topic.schema_settings.encoding

    # Encode the data according to the message serialization type.
    if encoding == Encoding.BINARY:
        encoder = BinaryEncoder(bout)
        writer.write(record, encoder)
        data = bout.getvalue()
        print(f"Preparing a binary-encoded message:\n{data}")
    elif encoding == Encoding.JSON:
        data = json.dumps(record).encode("utf-8")
        print(f"Preparing a JSON-encoded message:\n{data}")
    else:
        print(f"No encoding specified in {topic_path}. Abort.")
        exit(0)

    future = publisher_client.publish(topic_path, data)
    print(f"Published message ID: {future.result()}")

except NotFound:
    print(f"{topic_id} not found.")
