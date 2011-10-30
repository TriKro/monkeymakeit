# perl split_pages.pl < doris

$chapter_number = 2;
@lines = [];
$words = 0;

sub new_chapter {
  @lines = [];
  $words = 0;
  ++$chapter_number;
}

sub print_chapter {
  open(my $f, ">", "doris_".$chapter_number.".txt");
  for ($i = 1; $i <= scalar(@lines); ++$i) {
    print $f $lines[$i];
  }
  close $f;
}

while(<>) {
  push @lines, $_;
  $words += scalar(split);
  if ($words > 200) {
    &print_chapter();
    &new_chapter();
  }
}

&print_chapter();
