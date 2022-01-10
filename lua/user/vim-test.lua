vim.cmd [[
  let test#strategy = 'neovim'
  let g:ultest_use_pty = 1
  let g:ultest_output_on_line = 0
  let g:test#echo_command = 0


  let g:test#php#phpunit#executable = 'docker exec b6eb55 /var/www/app/vendor/bin/phpunit --configuration /var/www/app/phpunit.xml.dist'
  let test#javascript#jest#options = "--color=always"
  let test#neovim#term_position= "vert botright 70"


  nmap <silent><leader>un :TestNearest<CR>
  nmap <silent><leader>uf :TestFile<CR>
  nmap <silent><leader>us :TestSuite<CR>
  nmap <silent><leader>ul :TestLast<CR>
  nmap <silent><leader>uv :TestVisit<CR>
  nmap <silent><leader>uo :UltestSummary<CR>
  nmap <silent><leader>uu :Ultest<CR>
  nmap <silent><leader>uj <Plug>(ultest-output-jump)
  nmap <silent><leader>uN <Plug>(ultest-run-nearest)
  nmap <silent><leader>uF <Plug>(ultest-run-file)
  nmap <silent><leader>u[ <Plug>(ultest-prev-fail)
  nmap <silent><leader>u] <Plug>(ultest-next-fail)

  augroup UltestRunner
  au!
  au BufWritePost * UltestNearest
  augroup END

]]
