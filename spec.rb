$:<<'spec'  # add to load path
files = Dir.glob('spec/**/*.rb')
files.each{|file| require file.sub(/^spec\/|.rb$/,'')}