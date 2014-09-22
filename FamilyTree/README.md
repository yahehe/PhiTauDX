FamilyTree
==========

* Setup
*# Install Ruby (https://www.ruby-lang.org/en/downloads/)
*# Install Graphviz (http://www.graphviz.org/)
*# Install Ruby-Graphviz gem (gem install ruby-graphviz)

* Creating the graph
** Run >ruby treegen.rb

* Updating the graph
** tree.txt contains all the lineage information, in the format Big|Pledge Class|Little|Pledge Class
** Pledge classes that are unknown should be marked with ??? and fixed as soon as possible
** Information should be entered in ascending order (newest information/pledge classes at the bottom, alpha class at the top with ??? pledge class