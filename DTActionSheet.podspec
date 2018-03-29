Pod::Spec.new do |spec|
  spec.name = "DTActionSheet"
  spec.version = "1.0.2"
  spec.summary = "Simple customizable action sheet."
  spec.homepage = "https://github.com/danjiang/DTActionSheet"
  spec.license = { type: 'MIT', file: 'LICENSE' }
  spec.authors = { "Dan Jiang" => 'danjiang5956@gmail.com' }
  spec.social_media_url = "http://twitter.com/danjianglife"

  spec.platform = :ios, "8.4"
  spec.requires_arc = true
  spec.source = { git: "https://github.com/danjiang/DTActionSheet.git", tag: spec.version, submodules: true }
  spec.source_files = "Sources/**/*.{h,swift}"
  spec.resources = "Sources/*.bundle"
end
