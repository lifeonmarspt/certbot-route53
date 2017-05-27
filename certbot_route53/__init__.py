"""Certbot Route53 plugin."""
import sys

import certbot_dns_route53


sys.modules['certbot_route53'] = certbot_dns_route53
