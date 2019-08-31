# A fully functioning ML FLow, GitLab CI, AWS Sample Project

A fully functioning sample should support this workflow:

- (local) train a model locally, be happy with it
- (local) commit the new configuration to VC, push
- (GitLab CI) trains, evaluates on new configuration, logs with MLFlow
- (ML Server) receives logs, serves UI, stores logs in AWS S3
- (local) view results in UI

technologies used for that:

- Python module mlflow
- terraform to setup ML Server as (???) instance, Fargate task,...

## How To

1.  Fire up an instance with ML Server running. (folder infrastructure)

2.  Check it by running the example from the documentation via
    `python log_sth.py`
    then check the ML Flow board (http://yourip:5000)

3.  Check it with gitLab (ci file) ...

## More Info

Make sure to backup the logs to S3.
The tracking server has an "artifact" store, where you could log stuff to,
but I'm not sure why you'd prefer that over your usual artifact store.
