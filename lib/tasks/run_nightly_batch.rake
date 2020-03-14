desc 'purge tasks that should be deleted and reset daily tasks'
task :run_nightly_batch do
	unless File.exists?("hello-world.txt")
		File.open("hello-world", 'w') { |f| f.puts "hello world!" }
	end
end
