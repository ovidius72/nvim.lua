vim.cmd [[
  let test#strategy = 'vimux'
  let g:ultest_use_pty = 1
  let g:ultest_output_on_line = 0


  let g:test#php#phpunit#executable = 'docker exec b6eb55 /var/www/app/vendor/bin/phpunit --configuration /var/www/app/phpunit.xml.dist'
  let test#javascript#jest#options = "--color=always"


  nmap <silent><leader>atn :TestNearest<CR>
  nmap <silent><leader>ati :TestNearest -strategy=floaterm<CR>
  nmap <silent><leader>atf :TestFile<CR>
  nmap <silent><leader>ats :TestSuite<CR>
  nmap <silent><leader>atl :TestLast<CR>
  nmap <silent><leader>atv :TestVisit<CR>
  nmap <silent><leader>ato :UltestSummary<CR>
  nmap <silent><leader>atu :Ultest<CR>
  nmap <silent><leader>atj <Plug>(ultest-output-jump)
  nmap <silent><leader>atN <Plug>(ultest-run-nearest)
  nmap <silent><leader>atF <Plug>(ultest-run-file)
  nmap <silent>[t <Plug>(ultest-prev-fail)
  nmap <silent>]t <Plug>(ultest-next-fail)

  augroup UltestRunner
  au!
  au BufWritePost * UltestNearest
  augroup END

]]
