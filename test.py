# -*- coding: utf-8 -*-

import unittest
import requests

class RquestTestCase(unittest.TestCase):
    def test_request(self):
        
        r = requests.get("https://github.com")
        self.assertEqual(r.status_code, 200)

if __name__ == '__main__':
    unittest.main()