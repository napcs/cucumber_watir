require 'cucumber/rake/task'
 
Cucumber::Rake::Task.new do |t|
  t.cucumber_opts = %w{--format pretty}
end

desc "shows step definitions"
task :steps do
  
   steps = Dir.glob("./features/**/*_steps.rb")
   step_defs = ""
   steps.each do |step_file|
     step_defs <<  File.readlines(step_file).grep(/^###/).join
   end
   puts step_defs.gsub('### ','')
end

task :default => :cucumber