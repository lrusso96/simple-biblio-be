# frozen_string_literal: true

# This file should contain all the record creation needed to seed
# the database with its default values.
# The data can then be loaded with the rails db:seed command
# (or created alongside the database with db:setup).

feedbooks = { id: 1, name: 'Feedbooks' }
libgen = { id: 2, name: 'Libgen' }
standard_ebooks = { id: 3, name: 'StandardEbooks' }

Provider.create([feedbooks, libgen, standard_ebooks])
