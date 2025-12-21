apiVersion: v1
kind: Service
metadata:
  name: ${APP_NAME}
  namespace: app
spec:
  selector:
    app: ${APP_NAME}
  ports:
    - protocol: TCP
      port: 8080       # 对外暴露端口
      targetPort: 8080 # Pod 容器端口
  type: ClusterIP      # 默认 ClusterIP，也可以改成 LoadBalancer