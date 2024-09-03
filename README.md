# Qdrant CI/CD pipeline

<a href="https://dash.elest.io/deploy?source=cicd&social=dockerCompose&url=https://github.com/elestio-examples/qdrant"><img src="deploy-on-elestio.png" alt="Deploy on Elest.io" width="180px" /></a>

Deploy Qdrant server with CI/CD on Elestio

<img src="qdrant.png" style='width: 100%;'/>
<br/>
<br/>

# Once deployed ...

You can open Qdrant ADMIN UI here:

    URL: https://[CI_CD_DOMAIN]:6333/dashboard
    password: [ADMIN_PASSWORD]

# Using Qdrant

After deployment, you can access and utilize Qdrant with the provided credentials:

    host: [CI_CD_DOMAIN]
    port: 6333
    api_key: [ADMIN_PASWORD]

# Examples

You can interact with Qdrant using various programming languages. Below are examples demonstrating its usage in Node.js with your credentials:

## Initializing QdrantClient

First, install the Qdrant JavaScript client by running the following command:

    npm install @qdrant/js-client-rest

Then, create a new client instance:

    const { QdrantClient } = require("@qdrant/js-client-rest");

    const client = new QdrantClient({
        host: "[CI_CD_DOMAIN]",
        port: 6333,
        apiKey: "[ADMIN_PASWORD]",
    });

## Creating a Collection

You can create a collection with specific configurations. Here's an example:

    client.createCollection("example", {
        vectors: {
            size: 768,
            distance: "Cosine",
        },
        optimizers_config: {
            memmap_threshold: 20000,
        },
        quantization_config: {
            scalar: {
                type: "int8",
                always_ram: true,
            },
        },
    });

## Listing Collections

To list existing collections, use the following code:

    const listCollections  = async () => {
        const result = await client.getCollections();
        console.log("List of collections:", result.collections);
    };

    listCollections ();

# Documentation

Feel free to explore further functionalities and features provided by Qdrant here:

https://qdrant.tech/documentation/guides/administration/
