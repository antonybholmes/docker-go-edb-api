git clone git@github.com:antonybholmes/go-edb-api.git
git clone git@github.com:antonybholmes/go-dna.git
git clone git@github.com:antonybholmes/go-loctogene.git
git clone git@github.com:antonybholmes/go-utils.git
git clone git@github.com:antonybholmes/go-gene-annotation.git

pwd=`pwd`
for d in `find . -maxdepth 1 -type d`
do
	cd ${d}
	git pull
	cd ${pwd}
done
