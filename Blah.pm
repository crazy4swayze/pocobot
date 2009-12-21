package POE::Component::IRC::Plugin::Blah;

use strict;
use warnings;
use POE::Component::IRC::Plugin qw(:ALL);
use Data::Dumper;

sub new {
    my $package = shift;
    my $self = bless {@_}, $package;
    return $self;
}

sub PCI_register {
    my ($self,$irc) = @_;
    $irc->plugin_register( $self, 'SERVER', qw(chan_mode) );
    return 1;
}

sub PCI_unregister {
    return 1;
}

sub S_chan_mode {
    my ($self, $irc, $nickstr, $channel, $mode, $mask) = @_;
    warn
        Data::Dumper->Dumper($irc->channel_ban_list($$channel));
    return PCI_EAT_NONE;
}

1;
