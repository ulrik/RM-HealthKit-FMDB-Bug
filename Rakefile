# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'

begin
  require 'bundler'
  Bundler.require
rescue LoadError
end

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'hk_test'

  app.frameworks += ['HealthKit']
  app.entitlements['com.apple.developer.healthkit'] = true
  
  app.pods do
    pod 'SSZipArchive'
    pod 'FMDB', '~> 2.6.2'
  end    
end
