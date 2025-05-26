FROM ghcr.io/demo151996/jdk21-custom
EXPOSE 8080
ADD /build/libs/Devx-*.jar app.jar
RUN cd / && \
    curl -sS "https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem" > rds-combined-ca-bundle.pem && \
    awk 'split_after == 1 {n++;split_after=0} /-----END CERTIFICATE-----/ {split_after=1}{print > "rds-ca-" n ".pem"}' < rds-combined-ca-bundle.pem  && \
    for CERT in rds-ca-*; do alias=$(openssl x509 -noout -text -in $CERT | perl -ne 'next unless /Subject:/; s/.*(CN=|CN = )//; print'); echo "Importing $alias"; keytool -import -file ${CERT} -alias "${alias}" -storepass changeit -keystore rds-truststore.jks -noprompt; rm $CERT; done && \
    rm rds-combined-ca-bundle.pem

ENTRYPOINT ["java", "-jar","/app.jar"]

