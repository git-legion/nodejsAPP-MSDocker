pipeline {
    agent { label 'nodeapp' } // Directs execution to your specific node

    environment {
        DOCKER_USER = 'iamthelegion' 
        REGISTRY = 'docker.io'
        // Generating a random tag using the build number and a random hex
        TAG = "${env.BUILD_NUMBER}-${sh(script: 'head /dev/urandom | tr -dc A-Za-z0-9 | head -c 4', returnStdout: true).trim()}"
    }

    stages {
        stage('Checkout') {
            steps {
                // Ensuring we have the latest code before building
                git branch: 'main', url: 'https://github.com/git-legion/nodejsAPP-MSDocker.git'
            }
        }

        stage('Build, Push & Deploy') {
            steps {
                script {
                    def components = ['FrontEnd', 'backend', 'mysql']
                    // Detect changed directories between last and current commit
                    def changedFiles = sh(script: "git diff --name-only HEAD~1 HEAD || true", returnStdout: true).trim()

                    for (comp in components) {
                        // Only build if the component's folder has changes
                        if (changedFiles.contains(comp)) {
                            echo "Detected changes in ${comp}. Starting update..."
                            
                            dir(comp) {
                                def fullImage = "${DOCKER_USER}/nodeapp-${comp.toLowerCase()}:${TAG}"
                                
                                // Build and Push using the 'dockerhub-creds' we set up
                                docker.withRegistry("https://${REGISTRY}", 'dockerhub-creds') {
                                    def img = docker.build(fullImage)
                                    img.push()
                                }

                                // Deployment logic based on your specific requirements
                                echo "Deploying ${comp} container..."
                                sh "docker stop ${comp.toLowerCase()} || true"
                                sh "docker rm ${comp.toLowerCase()} || true"

                                if (comp == 'FrontEnd') {
                                    sh "docker container run -d --name frontend -p 5000:5000 --network host ${fullImage}"
                                } 
                                else if (comp == 'mysql') {
                                    sh "docker container run -d --name mysql --network host -e MYSQL_ROOT_PASSWORD=root ${fullImage}"
                                } 
                                else if (comp == 'backend') {
                                    sh "docker container run -d --name backend --network host ${fullImage}"
                                }
                            }
                        } else {
                            echo "No changes in ${comp}, skipping build."
                        }
                    }
                }
            }
        }
    }
}
