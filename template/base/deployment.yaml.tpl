apiVersion: apps/v1
kind: Deployment
metadata:
  name: ${APP_NAME}
  namespace: app
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ${APP_NAME}
  template:
    metadata:
      labels:
        app: ${APP_NAME}
    spec:
      containers:
        - name: ${APP_NAME}
          image: registry.cn-hangzhou.aliyuncs.com/devflow/${APP_NAME}:${TAG}
          volumeMounts:
            - name: config-volume
              mountPath: /etc/${APP_NAME}/config   # 挂载到容器内路径
              readOnly: true
      volumes:
        - name: config-volume
          configMap:
            name: ${APP_NAME}
