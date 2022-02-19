## Automatic Installation
Jupyter will not start, if the environment variable `JUPYTER_NOTEBOOK_PASSWORD` & `JUPYTER_APP_NAME` was not set.

If you want to customize your app, easiest is to fork this repository.

### One Click Deployment
[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://dashboard.heroku.com/new?template=https://github.com/DarkWind25/Jupyter-x-Docker-on-Heroku)

If you want to add more packages or python packages,
1. Fork this repository
2. Edit Dockerfile for adding packages
3. Push repositoru on GitHub
4. To auto deploy your repository you have to edit this file on line 7 which contain `Deploy` button.Just replace `https://github.com/DarkWind25/Jupyter-x-Docker-on-Heroku` to your GitHub repository URL.
 
The above steps you can use if you don't have Docker in your system(i.e. mostly Mobiles)
