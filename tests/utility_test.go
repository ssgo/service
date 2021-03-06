package tests

import (
	"fmt"
	"github.com/ssgo/s"
	"testing"
)

func TestMakeId(tt *testing.T) {
	as := s.AsyncStart()
	ids := map[string]bool{}
	for i := 0; i < 100000; i++ {
		uid := s.UniqueId()
		if ids[uid] {
			fmt.Println("重复", uid)
			break
		}
		ids[uid] = true
	}
	as.Stop()
}
