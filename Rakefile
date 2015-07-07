require "bundler/gem_tasks"

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'lib/smtp_lw'
  t.test_files = FileList['test/lib/smtp_lw/**/*_test.rb']
  t.verbose = true
end

task :default => :test

