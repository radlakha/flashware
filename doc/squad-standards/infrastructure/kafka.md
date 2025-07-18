# Kafka Standards

Best practices for Kafka integration, focusing on FP paradigms.

## Preferred Tools
- Clojure: Use kafka-clj or Jackdaw library for producers/consumers.
- Configuration: Use schema registry for Avro/JSON schemas.

## Best Practices
- Producers: Ensure idempotency with unique keys.
- Consumers: Handle offsets manually for exactly-once semantics.
- Security: Use SSL and ACLs.

## FP Tips
- Events as Immutable: Treat messages as immutable data; use reductions for state derivation.
- Stream Processing: Leverage Kafka Streams with functional transformations.

## Example (Clojure)
```clojure
(require '[jackdaw.client :as jc])

(defn produce-event [producer topic event]
  (jc/produce! producer {:topic topic} nil event))
```

Add squad topics and configs.
