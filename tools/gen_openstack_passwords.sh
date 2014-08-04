#!/bin/bash

PASSFILE=./group_vars/openstack_password.yml

gen_password() {
openssl rand -hex 10
}

if [ ! -z "$PASSFILE" ]; then
   for p in RABBIT_PASS	KEYSTONE_DBPASS	DEMO_PASS ADMIN_PASS GLANCE_DBPASS \
	    GLANCE_PASS NOVA_DBPASS NOVA_PASS DASH_DBPASS CINDER_DBPASS	\
	    CINDER_PASS	NEUTRON_DBPASS NEUTRON_PASS HEAT_DBPASS HEAT_PASS \
	    CEILOMETER_DBPASS CEILOMETER_PASS TROVE_DBPASS TROVE_PASS; do
      echo "${p}: `gen_password`" >> $PASSFILE
   done
fi
