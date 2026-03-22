## Vector DB Use Case

- A vector database enables semantic search, which focuses on meaning rather than exact wording. By converting both the contract text and user queries into embeddings (numerical vector representations), the system can identify sections that are contextually similar to the question. For example, even if a clause does not explicitly use the phrase “termination clauses,” it can still be retrieved if its meaning aligns with termination conditions.

- The vector database stores embeddings of contract chunks (e.g., paragraphs or sections) and allows efficient similarity search. When a lawyer asks a question, the system embeds the query and retrieves the most relevant sections based on cosine similarity. These results can then be passed to a language model to generate precise answers.

- Overall, a vector database is essential for handling the scale, variability, and semantic complexity of legal documents, enabling accurate and intuitive natural language search.