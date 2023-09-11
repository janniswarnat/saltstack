job1:
  schedule.present:
    - function: state.sls
    - job_args:
        - nginx-hello-world
    - seconds: 60
    #- job_args:
    #- bind
    #- cron: '*/1 * * * *'

#job2:
#  schedule.present:
#    - function: nginx-hello-world.sls
#    - seconds: 60

job3:
  schedule.present:
    - function: test.ping
    - seconds: 15
#    - splay: 10

