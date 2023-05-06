local function init()
  require 'verdverm.vim'.init()
  require 'verdverm.packer'.init()
  require 'verdverm.tabs'.init()
  require 'verdverm.cue'.init()
end

return {
  init = init,
}
