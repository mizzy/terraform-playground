.PHONY: build deploy

build:
	docker run -v `pwd`:`pwd` -w `pwd` -i -t lambci/lambda:build-ruby2.5 bundle install --path ./vendor/bundle

deploy: build
	lambroll deploy \
		--tfstate ../terraform/terraform.tfstate
