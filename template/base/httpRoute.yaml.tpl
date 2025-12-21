apiVersion: gateway.networking.k8s.io/v1
kind: HTTPRoute
metadata:
  name: ${APP_NAME}
  namespace: app
spec:
  hostnames:
    - ${APP_NAME}.bei.com
  parentRefs:
    - group: gateway.networking.k8s.io
      kind: Gateway
      name: https
      namespace: istio-system
  rules:
    - backendRefs:
        - name: ${APP_NAME}
          namespace: app
          port: 8080
          weight: 1
      matches:
        - path:
            type: PathPrefix
            value: /