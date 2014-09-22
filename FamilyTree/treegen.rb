require 'graphviz'

file = File.new("tree.txt","r")
g = GraphViz.new( :G, :type => :digraph )
bros = Hash.new
classes = Hash.new

colors = {
    "???"=>0,
    "Alpha"=>10,
    "Beta"=>20,
    "Gamma"=>30,
    "Delta"=>40,
    "Epsilon"=>50,
    "Zeta"=>60,
    "Eta"=>70,
    "Theta"=>70,
    "Iota"=>90,
    "Kappa"=>100,
    "Lambda"=>110,
    "Mu"=>120,
    "Nu"=>130,
    "Xi"=>140,
    "Omicron"=>150,
    "Pi"=>160,
    "Rho"=>170,
    "Sigma"=>180,
    "Tau"=>190,
    "Upsilon"=>200,
    "Phi"=>210,
    "Chi"=>220,
    "Psi"=>230,
    "Omega"=>240,
    "Disaffiliated"=>-1
}

def num(n)
    s = "#cfb53b"
    s = "#dc143c" if n == -1
    return s
end
while (line = file.gets)                                       
    line.chomp!
    next if line.empty?
    brothers = line.split("|")
    big = brothers[0]+"\n"+brothers[1]
    big = big.rstrip
    little = brothers[2]+"\n"+brothers[3]
    little = little.rstrip
    bnum = 0
    lnum = 0
    unless bros.include?(big)
        brother_class = brothers[1].split(" ")
        brother_class.each{|c| bnum+=colors[c]} 
        bros[big] = g.add_nodes(big, :style=>"filled",:color=>num(bnum))
        clazz = brothers[1]
        unless clazz.eql?("???")
            unless classes.include?(clazz)
                classes[clazz] = g.add_nodes(clazz, :style=>"filled",:color=>num(bnum))
            end
            g.add_edges(classes[clazz],bros[big])
        end
    end
    next if brothers[2].eql?("???")
    unless bros.include?(little)
        brother_class = brothers[3].split(" ")
        brother_class.each{|c| lnum+=colors[c]}
        bros[little] = g.add_nodes(little, :style=>"filled",:color=>num(lnum))
    end
    
    b = bros[big]
    l = bros[little]
    #puts brothers[0] + " " + brothers[2] + " " + (lnum-bnum).to_s
    g.add_edges(b,l)
end
g.output( :png => "trees.png" )