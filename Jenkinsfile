pipeline {
  agent {
      label 'qatest'
  }
 
  stages {
	    stage('intialize') {
	      steps {
	        sh 'echo "PATH= ${PATH}"'
	      }
	    }
        
    
	    stage('Run Robot Tests') {
	      steps {
		        	sh 'docker run -v /opt/portail-b2c:/robot -v /opt/portail-b2c/Result:/results  robot_selenium --outputdir /results /robot/TestSuite/automation_b2c.robot'
		        	
		        	sh 'exit 0'
	      		}
	      post {
        	always {
		        script {
		          step(
			            [
			              $class              : 'RobotPublisher',
			              outputPath          : 'results',
			              outputFileName      : '**/output.xml',
			              reportFileName      : '**/report.html',
			              logFileName         : '**/log.html',
			              disableArchiveOutput: false,
			              passThreshold       : 50,
			              unstableThreshold   : 40,
			              otherFiles          : "**/*.png,**/*.jpg",
			            ]
		          	)
		        }
	  		}		
	    }
	}    
  }
  
}