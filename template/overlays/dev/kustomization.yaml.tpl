resources:
  - ../../base
generatorOptions:
  disableNameSuffixHash: true
configMapGenerator:
  - name: ${APP_NAME}
    namespace: app
    files:
      - config.yaml
    behavior: create
patchesStrategicMerge:
  - deployment-patch.yaml
