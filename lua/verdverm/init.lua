local function init()
  require 'verdverm.vim'.init()
  require 'verdverm.packer'.init()
  require 'verdverm.cue'.init()
  require 'verdverm.tabs'.init()
  -- require 'verdverm.venn'.init()
end

return {
  init = init,
}
