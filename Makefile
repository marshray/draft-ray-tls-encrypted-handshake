# Here's how I set use xml2rfc:
#
# export PYTHONUSERBASE=$HOME/ietf/xml2rfc
# python setup.py install --user
#

version := pre01

all: draft-ray-tls-encrypted-handshake-${version}.html draft-ray-tls-encrypted-handshake-${version}.txt

export PATH := $(shell readlink -f ../../xml2rfc/bin):${PATH}
export PYTHONUSERBASE := $(shell readlink -f ../../xml2rfc)

exp.xml:
	xml2rfc draft-ray-tls-encrypted-handshake.xml -v -b exp --exp

draft-ray-tls-encrypted-handshake-${version}.html: exp.xml
	xml2rfc draft-ray-tls-encrypted-handshake.xml -v -b draft-ray-tls-encrypted-handshake-${version} --html

draft-ray-tls-encrypted-handshake-${version}.txt: exp.xml
	xml2rfc draft-ray-tls-encrypted-handshake.xml -v -b draft-ray-tls-encrypted-handshake-${version} --text
