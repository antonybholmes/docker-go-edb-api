git clone git@github.com:antonybholmes/go-edb-api.git
git clone git@github.com:antonybholmes/go-dna.git
git clone git@github.com:antonybholmes/go-genes.git
git clone git@github.com:antonybholmes/go-auth.git
git clone git@github.com:antonybholmes/go-math.git
git clone git@github.com:antonybholmes/go-sys.git
git clone git@github.com:antonybholmes/go-mailer.git
git clone git@github.com:antonybholmes/go-mutations.git
git clone git@github.com:antonybholmes/go-gene-conversion.git
git clone git@github.com:antonybholmes/go-microarray.git
git clone git@github.com:antonybholmes/go-motiftogene.git

pwd=`pwd`
for d in `find . -maxdepth 1 -type d`
do
	cd ${d}
	git pull
	cd ${pwd}
done

#mkdir logs
#mkdir data
