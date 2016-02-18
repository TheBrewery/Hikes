def system_or_exit(cmd, stdout = nil)
  puts "Executing #{cmd}"
  cmd += " >#{stdout}" if stdout
  system(cmd) or raise "******** Build failed ********"
end

task :default => [:trim_whitespace, :sort_xcode_project_file]

task :sort_xcode_project_file do
  system_or_exit("./Scripts/sort-Xcode-project-file.pl *.xcodeproj/project.pbxproj")
end

task :trim_whitespace do
  system_or_exit(%Q[git status --short | awk '{if ($1 != "D" && $1 != "R") print $2}' | grep -e '.*\.[mh(swift)]$' | xargs sed -i '' -e 's/	/    /g;s/ *$//g;'])
end