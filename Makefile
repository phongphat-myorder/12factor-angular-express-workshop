.PHONY: set npm-install

set:
	git clone git@github.com:phongphat-myorder/RVE-frontend-repo.git
	git clone git@github.com:phongphat-myorder/RVE-backend-repo.git

npm-install:
	cd RVE-frontend-repo && npm install && cd ../RVE-backend-repo && npm install