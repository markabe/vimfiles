" Fuzzy find files in project a la TextMate
  let g:fuzzy_ignore = "*.svg;*.ttf;*.psd;*.png;*.jpg;*.gif;*.exe;*.dll;*.vsmdi;*.pdb;*.pdf;*.lnk;*.sln;*.csproj;*.cache"
  "let g:fuzzy_ceiling = 5000
  let g:fuzzy_matching_limit = 70

" Use FuzzyFinder to replace built-in tag navigation :tag and <C-]>:
  nnoremap <silent> <C-f><C-t> :FuzzyFinderTag!<CR>
  nnoremap <silent> <C-]>      :FuzzyFinderTag! <C-r>=expand('<cword>')<CR><CR>
