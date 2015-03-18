#!/usr/bin/env python
import subprocess
import argparse
import socket

def dig(host, domain, server):
	answer_section = []
	answer_start = False
	output = subprocess.check_output(['/usr/bin/dig', '@{0}'.format(server), host, '+domain={0}'.format(domain)])
	for line in output.split('\n'):
		if line.startswith(';; ANSWER SECTION:'):
			answer_start = True

		elif line.startswith(';;'):
			answer_start = False
		elif answer_start:
			stripped = line.strip()
			if stripped:
				try:
					parts = stripped.split()
					socket.inet_pton(socket.AF_INET, parts[-1])
					return parts[-1]
				except:
					pass
	return None

def get_hosts(host_list):
	hosts = []
	with open(host_list) as fp:
		for line in fp:
			stripped = line.strip()
			if stripped:
				hosts.append(stripped)
	return hosts 

def erase_hosts(hosts):
	with open('/etc/hosts') as fp:
		lines = fp.readlines()

	with open('/etc/hosts', 'w') as fp:
		for line in filter(lambda x: all(map(lambda y: y not in x, hosts)), lines):
			fp.write(line)
		fp.truncate()

def do_erase(args):
	erase_hosts(get_hosts(args.hosts))

def do_update(args):
	hosts = get_hosts(args.hosts)
	erase_hosts(hosts)

	with open('/etc/hosts', 'a') as fp:
		fp.write('\n')
		for host in hosts:
			ip = dig(host, args.domain, args.server)
			if ip is not None:
				fp.write('{0}\t{1}.{2}\t{1}\n'.format(ip, host, args.domain))

		fp.truncate()

if __name__ == '__main__':
	parser = argparse.ArgumentParser()
	parser.add_argument('-f', '--hosts', dest='hosts', help='File containing a list of hosts to resolve', required=True)
	parser.add_argument('-d', '--domain', dest='domain', default='meerkatlab.org', help='Search Domain to use for DNS resolution')
	parser.add_argument('-s', '--dns-server', dest='server', default='10.65.63.1', help='DNS server to use for resolution')

	subs = parser.add_subparsers()
	erase_cmd = subs.add_parser('erase', help='Erase entries for hosts from /etc/hosts')
	erase_cmd.set_defaults(func=do_erase)

	update_cmd = subs.add_parser('update', help='Update host entries in /etc/hosts')
	update_cmd.set_defaults(func=do_update)

	args = parser.parse_args()
	args.func(args)
