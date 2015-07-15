# puppet-npd6

## Overview

Install, configure and enable the Neighbor Proxy Daemon for IPv6.
See http://npd6.github.io/npd6/ for more details.

* `npd6` : Main class

Options for `/etc/npd6.conf`. See `npd6.conf(5)` for details :

 * `prefix` : Mandatory IPv6 prefix
 * `interface` : Defaults to `eth0`
 * `ralogging`
 * `listtype`
 * `addrlist` : Array
 * `exprlist` : Array
 * `listlogging`
 * `collecttargets`
 * `linkoption`
 * `ignorelocal`
 * `routerna`
 * `maxhops`
 * `pollerrorlimit`

Red Hat Enterprise Linux packages may be found on http://dl.marmotte.net/rpms/

## Example

In the following example, all Neighbor Solicitation requests on the specified
interface and for any address contained in the specified prefix will be
answered.

Puppet DSL :

```puppet
class { '::npd6':
  prefix    => '2001:db8:2:60a6::/64',
  interface => 'br0',
}
```

Hiera YAML :

```yaml
classes:
  - '::npd6'
npd6::prefix: '2001:db8:2:60a6::/64'
npd6::interface: 'br0'
```

