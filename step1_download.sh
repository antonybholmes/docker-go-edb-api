git clone git@github.com:antonybholmes/go-edb-api.git
git clone git@github.com:antonybholmes/go-dna.git
git clone git@github.com:antonybholmes/go-loctogene.git

pwd=`pwd`
for d in `find . -maxdepth 1 -type d`
do
	cd ${d}
	git pull
	cd ${pwd}
done
