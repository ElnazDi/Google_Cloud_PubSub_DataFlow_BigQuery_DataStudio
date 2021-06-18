import argparse

from google.cloud import pubsub_v1


def sub(project_id, subscription_id, timeout=None):
    """Receives messages from a Pub/Sub subscription."""
    # Initialize a Subscriber client
    subscriber_client = pubsub_v1.SubscriberClient()
    # Create a fully qualified identifier in the form of
    # `projects/{project_id}/subscriptions/{subscription_id}`
    subscription_path = subscriber_client.subscription_path(project_id, subscription_id)

    def callback(message):
        print(f"Received {message}.")
        # Acknowledge the message. Unack'ed messages will be redelivered.
        message.ack()
        print(f"Acknowledged {message.message_id}.")

    streaming_pull_future = subscriber_client.subscribe(
        subscription_path, callback=callback
    )
    print(f"Listening for messages on {subscription_path}..\n")

    try:
        # Calling result() on StreamingPullFuture keeps the main thread from
        # exiting while messages get processed in the callbacks.
        streaming_pull_future.result(timeout=timeout)
    except:  # noqa
        streaming_pull_future.cancel()

    subscriber_client.close()


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter,
    )
    parser.add_argument("project_id", help="Google Cloud project ID")
    parser.add_argument("subscription_id", help="Pub/Sub subscription ID")
    parser.add_argument(
        "timeout", default=None, nargs="?", const=1, help="Pub/Sub subscription ID"
    )

    args = parser.parse_args()

    sub(args.project_id, args.subscription_id, args.timeout)
