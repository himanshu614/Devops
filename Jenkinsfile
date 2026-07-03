#!groovy

node {

    def BUILD_NUMBER = env.BUILD_NUMBER
    def RUN_ARTIFACT_DIR = "tests/${BUILD_NUMBER}"

    def HUB_ORG = env.HUB_ORG_DH
    def SFDC_HOST = env.SFDC_HOST_DH
    def JWT_KEY_CRED_ID = env.JWT_CRED_ID_DH
    def CONNECTED_APP_CONSUMER_KEY = env.CONNECTED_APP_CONSUMER_KEY_DH

    def sfCli = 'C:\\Program Files\\sf\\bin\\sf.cmd'

    echo "KEY IS"
    echo JWT_KEY_CRED_ID
    echo HUB_ORG
    echo SFDC_HOST
    echo CONNECTED_APP_CONSUMER_KEY

    stage('Checkout Source') {
        checkout scm
    }

    withCredentials([file(credentialsId: JWT_KEY_CRED_ID, variable: 'jwt_key_file')]) {

        stage('Salesforce Login') {

            def rc

            if (isUnix()) {

                rc = sh(
                    returnStatus: true,
                    script: """
"${sfCli}" org login jwt \
--client-id ${CONNECTED_APP_CONSUMER_KEY} \
--username ${HUB_ORG} \
--jwt-key-file ${jwt_key_file} \
--set-default-dev-hub \
--instance-url ${SFDC_HOST}
"""
                )

            } else {

                rc = bat(
                    returnStatus: true,
                    script: """
"${sfCli}" org login jwt ^
--client-id ${CONNECTED_APP_CONSUMER_KEY} ^
--username ${HUB_ORG} ^
--jwt-key-file "%jwt_key_file%" ^
--set-default-dev-hub ^
--instance-url ${SFDC_HOST}
"""
                )

            }

            if (rc != 0) {
                error "Hub Org authorization failed."
            }

            echo "Salesforce Login Successful."
        }

        stage('Deploy Metadata') {

            def rmsg

            if (isUnix()) {

                rmsg = sh(
                    returnStdout: true,
                    script: """
"${sfCli}" project deploy start \
--source-dir force-app \
--target-org ${HUB_ORG}
"""
                )

            } else {

                rmsg = bat(
                    returnStdout: true,
                    script: """
"${sfCli}" project deploy start ^
--source-dir force-app ^
--target-org ${HUB_ORG}
"""
                )

            }

            echo rmsg
        }
    }
}
