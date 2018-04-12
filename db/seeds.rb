# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# coding: utf-8

@user = User.new(:name => 'admin',:password => 'admin', :admin => true, :email => 'admin@exmple.com' ,:randomkey => SecureRandom.hex(16), :confirmed_at => "Tue, 10 Apr 2018 16:07:08 UTC +00:00")
@user.save :validate => false