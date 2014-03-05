REGRESS = init bloom_agg bloom_query
REGRESS_OPTS = --inputdir=test

DATA = pgbloomagg.sql

PG_CONFIG = pg_config
PGXS = $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
