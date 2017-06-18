Pod::Spec.new do |spec|
  spec.name = "DTActionSheet"
  spec.version = "1.0.1"
  spec.summary = "Simple customizable action sheet."
  spec.homepage = "https://github.com/danjiang/DTActionSheet"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Dan Jiang" => 'dan@danthought.com' }
  spec.social_media_url = "http://twitter.com/dtstudio"

  spec.platform = :ios, "8.4"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/danjiang/DTActionSheet.git", tag: spec.version, submodules: true }
  spec.source_files = "Sources/**/*.{h,swift}"
  spec.resources = "Sources/*.bundle"
end
