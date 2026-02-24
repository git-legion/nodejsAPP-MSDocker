pipeline {
    agent { label 'nodeapp' } 

    environment {
        DOCKER_USER = 'iamthelegion' // Update this!
        // Generate random tag: Build number + 4 random chars
        TAG = "${env.BUILD_NUMBER}-${sh(script: 'head /dev/urandom | tr -dc A-Za-z0-9 | head -c 4', returnStdout: true).trim()}"
    }

    stages {
        stage('Checkout') {
            steps {
                // This replaces 'checkout scm' for manual scripts
                git branch: 'main', url: 'https://github.com/git-legion/nodejsAPP-MSDocker.git'
            }
        }

        stage('Build & Deploy Components') {
            steps {
                script {
                    def components = ['FrontEnd', 'backend', 'mysql']
                    def changedFiles = sh(script: "git diff --name-only HEAD~1 HEAD || true", returnStdout: true).trim()

                    for (comp in components) {
                        if (changedFiles.contains(comp) || env.BUILD_CAUSE == "MANUALTRIGGER") {
                            echo "Processing ${comp}..."
                            
                            dir(comp) {
                                def fullImage = "${DOCKER_USER}/nodeapp-${comp.toLowerCase()}:${TAG}"
                                
                                // Build and Push
                                docker.withRegistry('https://index.docker.io/v1/', 'dockerhub-creds') {
                                    def img = docker.build(fullImage)
                                    img.push()
                                }

                                // Container Lifecycle
                                sh "docker stop ${comp.toLowerCase()} || true"
                                sh "docker rm ${comp.toLowerCase()} || true"
                                sh "docker run -d --name ${comp.toLowerCase()} ${fullImage}"
                            }
                        }
                    }
                }
            }
        }
    }
}
