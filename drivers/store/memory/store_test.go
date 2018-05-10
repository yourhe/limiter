package memory_test

import (
	"testing"
	"time"

	"github.com/yourhe/limiter"
	"github.com/yourhe/limiter/drivers/store/common"
	"github.com/yourhe/limiter/drivers/store/memory"
)

func TestMemoryStoreSequentialAccess(t *testing.T) {
	common.TestStoreSequentialAccess(t, memory.NewStoreWithOptions(limiter.StoreOptions{
		Prefix:          "limiter:memory:sequential",
		CleanUpInterval: 30 * time.Second,
	}))
}

func TestMemoryStoreConcurrentAccess(t *testing.T) {
	common.TestStoreConcurrentAccess(t, memory.NewStoreWithOptions(limiter.StoreOptions{
		Prefix:          "limiter:memory:concurrent",
		CleanUpInterval: 1 * time.Nanosecond,
	}))
}
