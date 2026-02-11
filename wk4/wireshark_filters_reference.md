# WireShark Display Filters Reference

## Quick Reference for Lab Exercises

### Exercise 1: ARP or DNS only
```
arp or dns
```

### Exercise 2: UDP or TCP only
```
udp or tcp
```
Alternative:
```
tcp or udp
```

### Exercise 3: TCP on port > 3000
```
tcp.port > 3000
```

### Exercise 4: HTTP only
```
http
```
Alternative:
```
http or http2
```

### Exercise 5: HTTP POST method
```
http.request.method == "POST"
```
**How to generate POST traffic:**
- Visit a website with a login form (e.g., a test login page)
- Fill in the form and submit it
- The POST request will be captured

### Exercise 6: UDP containing "google"
```
udp contains "google"
```
**How to generate this traffic:**
- Do a Google search or visit google.com
- DNS queries containing "google" will be captured

### Exercise 7: HTTP 404 Not Found
```
http.response.code == 404
```
**How to generate 404 traffic:**
- Visit a non-existent page, e.g., http://example.com/thispagedoesnotexist

### Exercise 8: TCP with ACK flag set
```
tcp.flags.ack == 1
```
Alternative:
```
tcp.flags.ack == 1
```
**Note:** Most TCP packets will have ACK set as it's part of normal TCP communication

### Exercise 9: Flow Graph - 3-way Handshake
**Steps:**
1. Start capturing traffic
2. Open a new TCP connection (visit any website)
3. Stop capturing
4. Find packets with same source/destination IP pair
5. Select those packets
6. Go to **Statistics → Flow Graph**
7. Look for:
   - SYN (first packet)
   - SYN-ACK (response)
   - ACK (confirmation)
8. Take screenshot showing the flow

## Additional Useful Filters

### Capture HTTP GET requests
```
http.request.method == "GET"
```

### Capture packets to/from specific IP
```
ip.addr == 192.168.1.1
```

### Capture packets from specific source IP
```
ip.src == 192.168.1.1
```

### Combine filters with AND
```
tcp and port 80
```

### Combine filters with OR
```
http or dns
```

### Exclude traffic
```
!arp
```
or
```
not arp
```

## Tips for Taking Screenshots

1. Make sure the filter is visible in the filter toolbar
2. Capture enough packets to demonstrate the filter is working
3. You may want to expand one packet in the details pane
4. Include the entire WireShark window (menu bar, toolbars, packet list, details)
5. Use a screenshot tool:
   - macOS: Cmd+Shift+4 (select area) or Cmd+Shift+5 (screenshot tool)
   - Windows: Snipping Tool or Win+Shift+S
   - Linux: gnome-screenshot or Spectacle

## Resources

- Display Filters: https://wiki.wireshark.org/DisplayFilters
- Capture Filters: https://wiki.wireshark.org/CaptureFilters
- User Guide: https://www.wireshark.org/docs/wsug_html_chunked/
