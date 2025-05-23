-- Argo
CREATE ROLE ${ARGO_POSTGRESQL_USER} WITH LOGIN PASSWORD '${ARGO_POSTGRESQL_PASSWORD}';
CREATE DATABASE ${ARGO_DATABSE} WITH OWNER ${ARGO_POSTGRESQL_USER};

-- Cosmotech API
CREATE ROLE ${COSMOTECH_API_READER_USERNAME} WITH LOGIN PASSWORD '${COSMOTECH_API_READER_PASSWORD}';
CREATE ROLE ${COSMOTECH_API_WRITER_USERNAME} WITH LOGIN PASSWORD '${COSMOTECH_API_WRITER_PASSWORD}';
CREATE ROLE ${COSMOTECH_API_ADMIN_USERNAME} WITH LOGIN PASSWORD '${COSMOTECH_API_ADMIN_PASSWORD}' CREATEDB;

-- SeaweedFS
CREATE ROLE ${SEAWEEDFS_USERNAME} WITH LOGIN PASSWORD '${SEAWEEDFS_PASSWORD}';
CREATE DATABASE ${SEAWEEDFS_DATABASE} WITH OWNER ${SEAWEEDFS_USERNAME};
-- We should be able to delegate that setup to the SeaweedFS chart with 'externalDatabase.initDatabaseJob.enable: true'
-- See https://github.com/bitnami/charts/issues/30030
\connect ${SEAWEEDFS_DATABASE} ${SEAWEEDFS_USERNAME};
CREATE TABLE IF NOT EXISTS filemeta (
  dirhash     BIGINT,
  name        VARCHAR(65535),
  directory   VARCHAR(65535),
  meta        bytea,
  PRIMARY KEY (dirhash, name)
);