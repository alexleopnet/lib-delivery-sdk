<?php

declare(strict_types=1);

namespace Paysera\DeliverySdk\Facade;

use Paysera\DeliveryApi\MerchantClient\Entity\OrderCreate;
use Paysera\DeliveryApi\MerchantClient\Entity\OrderUpdate;
use Paysera\DeliverySdk\Adapter\OrderCreateRequestAdapter;
use Paysera\DeliverySdk\Adapter\OrderUpdaterequestAdapter;
use Paysera\DeliverySdk\Entity\PayseraDeliveryOrderRequest;

class DeliveryOrderRequestAdapterFacade
{
    private OrderCreateRequestAdapter $createAdapter;
    private OrderUpdaterequestAdapter $updateAdapter;

    public function __construct(
        OrderCreateRequestAdapter $createAdapter,
        OrderUpdaterequestAdapter $updateAdapter
    ) {

        $this->createAdapter = $createAdapter;
        $this->updateAdapter = $updateAdapter;
    }

    public function convertCreate(PayseraDeliveryOrderRequest $request): OrderCreate
    {
        return $this->createAdapter->convert($request);
    }

    public function convertUpdate(PayseraDeliveryOrderRequest $request): OrderUpdate
    {
        return $this->updateAdapter->convert($request);
    }
}
