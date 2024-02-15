git clone git@github.com:antonybholmes/go-edb-api.git
git clone git@github.com:antonybholmes/go-dna.git
git clone git@github.com:antonybholmes/go-loctogene.git
git clone git@github.com:antonybholmes/go-gene.git
git clone git@github.com:antonybholmes/go-auth.git
git clone git@github.com:antonybholmes/go-math.git
git clone git@github.com:antonybholmes/go-env.git


pwd=`pwd`
for d in `find . -maxdepth 1 -type d`
do
	cd ${d}
	git pull
	cd ${pwd}
done

mkdir logs
mkdir data
