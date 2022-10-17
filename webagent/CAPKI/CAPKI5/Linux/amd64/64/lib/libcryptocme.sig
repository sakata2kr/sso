<?rsa version="1.0" encoding="utf-8"?>
<Configuration>
	<Product Id="Crypto-C ME">
		<Version>4.0.0.0</Version>
		<ReleaseDate>Jul 01 2011 11:49:55</ReleaseDate>
		<ExpDate>""</ExpDate>
		<Copyright>
			Copyright (C) RSA
		</Copyright>
		<Library Id="master">cryptocme</Library>
	</Product>
	<Runtime Id="runtime">
		<StartupConfig>
			<SelfTest>OnLoad</SelfTest>
		</StartupConfig>
		<LoadOrder>
			<Library Id="ccme_base">ccme_base</Library>
			<Library Id="ccme_base_non_fips">ccme_base_non_fips</Library>
			<Library Id="ccme_asym">ccme_asym</Library>
			<Library Id="ccme_ecc">ccme_ecc</Library>
			<Library Id="ccme_ecc_non_fips">ccme_ecc_non_fips</Library>
			<Library Id="ccme_ecdrbg">ccme_ecdrbg</Library>
			<Library Id="ccme_ecc_accel_fips">ccme_ecc_accel_fips</Library>
			<Library Id="ccme_ecc_accel_non_fips">ccme_ecc_accel_non_fips</Library>
			<Library Id="ccme_error_info">ccme_error_info</Library>
		</LoadOrder>
	</Runtime>
	<Signature URI="#ccme_base" Algorithm="FIPS140_INTEGRITY">MCwCFGwWtKDUSZFsZeZDIt+TVgJsnXqhAhR1SfkAd/c8BjEDYYyfEHVBM+uZmg==</Signature>
	<Signature URI="#ccme_base_non_fips" Algorithm="FIPS140_INTEGRITY">MC0CFFuwkX5m4awV4iwKgwBLBeVO5WrjAhUApPhY+e/o68x+nCjXPD4Mn0k8Shg=</Signature>
	<Signature URI="#ccme_asym" Algorithm="FIPS140_INTEGRITY">MC4CFQCStalYRp79v+MJ3nhcBuukuuyNXAIVAJ4yu3EC8aqkX5+PC7esFCLBX4r3</Signature>
	<Signature URI="#ccme_ecc" Algorithm="FIPS140_INTEGRITY">MC0CFQCew0ZlxSFIfyd0hQFStusorJvFuQIUdq+hpW/Scln5xRrNyhxS2ZBlLpE=</Signature>
	<Signature URI="#ccme_ecc_non_fips" Algorithm="FIPS140_INTEGRITY">MC0CFQC+moOecrsb7atUM64DZ5rQmJlAowIUEFmg/qDIU/Yn9WlxxsTZl7GiQUw=</Signature>
	<Signature URI="#ccme_ecdrbg" Algorithm="FIPS140_INTEGRITY">MC0CFHLVH4q1qs075qLGV8urm+ttK+FLAhUAoGy4cku8DZmDKsIckZB6aA79n5I=</Signature>
	<Signature URI="#ccme_ecc_accel_fips" Algorithm="FIPS140_INTEGRITY">MCwCFDYrdc77OjKildLdvV7ju/hQSlw5AhRiQKMb1PA+kQ+Ziw2VcD83dgBpVg==</Signature>
	<Signature URI="#ccme_ecc_accel_non_fips" Algorithm="FIPS140_INTEGRITY">MC4CFQCUtInYFey2lswyS3lUzYTshhtGxwIVAMS24JB1arZ8SSZlJ4Rqw3zdHE0/</Signature>
	<Signature URI="#ccme_error_info" Algorithm="FIPS140_INTEGRITY">MC0CFQC9MeEUfq5qsT4qxQa3tk+KAbwXXwIUG3DSB1kEvuEsBCtV2cjT9LOjv/g=</Signature>
	<Signature URI="#master" Algorithm="FIPS140_INTEGRITY">MC0CFQCjb3WDWRiAawGfZjLV7snNQ9kU3AIUFjOSXe2aawIpOh6Rps0zurM1SG0=</Signature>
	<Signature URI="#Crypto-C ME" Algorithm="FIPS140_INTEGRITY">MC0CFBFHU7H9qC1KBJFZha/kQfC+pEICAhUAwNzpuUQ0V/AZdstLkx9Vm5EVhrg=</Signature>
	<Signature URI="#runtime" Algorithm="FIPS140_INTEGRITY">MC0CFQCE/Bmch+Yiy3hijs1CuW4YlU+FegIUL+5/Z1Wd+iXFqu2KtUkMiQrIPGk=</Signature>
</Configuration>

